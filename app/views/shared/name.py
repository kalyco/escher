class RegistrarApi(object):
    __metaclass__ = ABCMeta

    @abstractmethod
    def create_record(self):
        pass

    @abstractmethod
    def delete_record(self):
        pass

    @abstractmethod
    def get_records(self):
        pass

    @abstractmethod
    def update_record(self):
        pass