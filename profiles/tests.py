import pytest

from django.urls import reverse
from django.contrib.auth.models import User

from .models import  Profile

class TestProfiles:

    def setup_method(self):
        user = User.objects.create(username='aaa', password='aaa')
        profile = Profile.objects.create(user=user , favorite_city='Marseille')

    @pytest.mark.django_db
    def test_index(self,client):
        url = reverse('profiles:index')
        response = client.get(url)
        assert response.status_code == 200
        assert "<title>Profiles</title>" in response.content.decode('utf-8')

    @pytest.mark.django_db
    def test_profile(self,client):
        url = reverse('profiles:profile', args=['aaa'])
        response = client.get(url)
        assert response.status_code == 200
        assert "<title>aaa</title>" in response.content.decode('utf-8')