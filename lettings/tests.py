import pytest
from .models import Letting, Address

from django.urls import reverse


@pytest.mark.django_db
class TestLettings:

    def setup_method(self):
        address = Address.objects.create(number=1, street='aaa', city='bbb', state='ccc', zip_code=5555, country_iso_code='rrrr')
        letting = Letting.objects.create(title='Art', address=address)

    def test_index(self,client):
        url = reverse('lettings:index')
        response = client.get(url)
        assert response.status_code == 200
        assert "<title>Lettings</title>" in response.content.decode('utf-8')

    def test_profile(self,client):
        url = reverse('lettings:letting', args=[1])
        response = client.get(url)
        assert response.status_code == 200
        assert "<title>Art</title>" in response.content.decode('utf-8')