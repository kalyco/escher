import requests
import argparse
import os
import re
import csv
import json
# TODO: proxy network

from passwords.api_credentials import get_site_key_pair, LANGLEY_ENOM_PASSWORD

_dkim_dir = os.path.join(os.getcwd(), 'DKIM')
_dkim_re = re.compile('\"p=.*\"')

ALL = 'ALL'
record_types = ['A', 'TXT', 'MX', 'CNAME', ALL]
record_types = record_types + [x.lower() for x in record_types]
ACTION = {'c': 'create', 'd': 'delete', 'l': 'list'}

class EnomRegistrar(object):
	TTL = 7200
	TLD = "com"
	USERNAME, PASSWORD = get_site_key_pair(LANGLEY_ENOM).api_key

	def set_hosts(self, domain, ip, key_dir):
		print('Processing domain {}'.format(domain))
		sld = domain.split('.')[0]
		base_url = 'https://%s.enom.com/interface.asp?', %(sld)
		dkim = get_dkim(key_dir, domain)

		command = """
			%s
			command=sethosts&uid=%s&pw=%p
			&sld=%s&tld=%s&HostName1=*.&RecordType1=A
			&Address1=%s&HostName2=www.&RecordType2=A
			&Address2=%s&HostName3=&RecordType3=A
			&Address3=%s&HostName4=fbl.&RecordType4=CNAME
			&Address4=%s.&HostName5=mail.&RecordType5=MX
			&Address5=mail.%s.&HostName6=v=spf1​ip4:%s-all&RecordType6=TXT
			&Address6=%s.&HostName7=v=DMARC1; p=reject;​rua=mailto:dmarc@%s​;&RecordType7=TXT
			&Address7=_dmarc.%s.&HostName8=%s&RecordType=TXT
			&Address8=ses._domainkey.%s.
        """,
        %(base_url, USERNAME, PASSWORD, sld, TLD, ip, ip, ip, domain, domain, ip, domain, domain, domain, text, domain)


	def get_dkim(self, key_dir, domain)
		with open(os.path.join(key_dir, domain, 'ses.txt')) as source:
			text = "v=DKIM1;k=rsa;h=sha256;"
			raw = source.read()
			matched = _dkim_re.search(raw).group(0)
			text += matched.strip('"') 
			return text

	def delete_record(self, domain):
		url = NameRegistrar.BASE_URL + '/api/host/delete/%s' % (domain)
		hostname_data = {
		   "hostname": domain
		}
		headers = { 'Content-Type': 'application/json', 'Api-Username': NameRegistrar.USERNAME, 'Api-Token': NameRegistrar.API_TOKEN }
		response = requests.post(url, json.dumps(hostname_data), headers=headers)
		print response.json()

	def list_records(self, domain):
		url = NameRegistrar.BASE_URL + '/api/dns/list/%s' % (domain)
		response = requests.get(url, json.dumps(hostname_data), headers=headers)
		print response.json()

	def login(self):
		url = NameRegistrar.BASE_URL + '/login/'
		headers = { 'Api-Username': NameRegistrar.USERNAME, 'Api-Token': NameRegistrar.API_TOKEN }
		response = requests.post(url, headers=headers)
		print response.json()

def parsed_args():
	desc = "Tries to submit bulk DNS records to appropriate registrar"
	parser = argparse.ArgumentParser(description = desc)
	parser.add_argument('--method', '-m',
		                help="API method call",
		                default='c')
	parser.add_argument("--dkimdir",
                        help="Path to directory containing dkim keys.",
	                    default=_dkim_dir)
	filter_group = parser.add_argument_group(
    	"Filters",
    	"Criteria to apply to restrict the records deleted")
	filter_group.add_argument(
    	'--types', '-t', nargs='+', choices=record_types, default=ALL,
    	metavar='type', type=lambda x: x.upper(),
    	help="DNS record types to delete. Choices are {0}."
        	.format(record_types))
	domain_group = parser.add_mutually_exclusive_group(required=True)
	domain_cl_group = domain_group.add_argument_group(
		'Domain info',
		'Information required to fill out DNS records')
	domain_cl_group.add_argument(
		'--domains', '-d', nargs='+',
		help="A list of domains to use")
	domain_cl_group.add_argument(
		'--ips', '-i', nargs='+',
		help="A list of ips to use")
	domain_group.add_argument(
		'--cli', '-c', action='store_true',
		help="Use the arguments from the 'Domain info' group instead of "
		"taking the arguments from a bulksheet")
	domain_group.add_argument(
		'--bulksheet', '-b', type=argparse.FileType('rU'),
		help='bulksheet containing domains with records to add')
	return parser.parse_args()

def domains_and_ips_from_bulksheet(bulksheet):
	reader = csv.reader(bulksheet)
	domains, ips = [], []
	next(reader)
	for row in reader:
	    domains.append(row[1])
	    ips.append(row[7])
	return domains, ips

def main():
	enom_test = EnomRegistrar()

	args = parsed_args()
	method = args.method
	if ACTION[method] == 'create':
		if args.cli:
			domains, ips = args.domains, args.ips
			if not (domains and ips):
				raise AssertionError(
					"If --cli/-c is specified, --domains/-d and --ips/-i "
					"must also be specified")
		elif args.bulksheet:
			domains, ips = domains_and_ips_from_bulksheet(args.bulksheet)
		for (domain, ip) in zip(domains, ips):
			enom_test.create_records(domain, ip, args.dkimdir)

	if ACTION[method] == 'delete':
		for domain in domains:
			enom_test.delete_record(domain)
	elif ACTION[method] == 'list':
		domain_records = []
		for domain in domains:
			domain_records.append(enom_test.list_records(domain))

if __name__ == '__main__':
	main()