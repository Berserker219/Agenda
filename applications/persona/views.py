from django.shortcuts import render
from django.views.generic import ListView, TemplateView
from rest_framework.generics import ListAPIView, CreateAPIView, RetrieveAPIView,DestroyAPIView, UpdateAPIView, RetrieveUpdateAPIView
# MODELOS
from .models import Person, Reunion
#Serializadores
from .serializers import (
    PersonSerializer,
    PersonaSerializer,
    # PersonaSerializer3,
    PersonaSerializer4,
    ReunionSeriealizer,
    ReunionSeriealizerLink,
    PersonPagination,
    CountReunionSerializer,

)

class ListaPersonas(ListView):
    template_name = 'persona/personas.html'
    context_object_name = 'personas'
    
    def get_queryset(self):
        return Person.objects.all()


class PersonListApiView(ListAPIView):

    serializer_class = PersonSerializer

    def get_queryset(self):
        return Person.objects.all()

class PersonListView(ListView):
    model = Person
    template_name = 'persona/lista.html'
    context_object_name = 'listaPersonas'

class PersonSearchApiView(ListAPIView):
    serializer_class = PersonSerializer

    def get_queryset(self):
        kword = self.kwargs['kword']
        return Person.objects.filter(
            full_name__icontains=kword
        )

# Creacion
class PersonCreateView(CreateAPIView):
    serializer_class = PersonaSerializer4

class PersonApiLista(ListAPIView):
    # serializer_class = PersonaSerializer
    serializer_class = PersonaSerializer4
    queryset = Person.objects.all()

    # def get_queryset(self):
    #     return Person.objects.all()


# Detalles
class PersonDetailView(RetrieveAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()


# Modificar
class PersonUpdateView(UpdateAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()


# Recupera y modifica
class PersonRetrieveUpdateView(RetrieveUpdateAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()

# Eliminar
class PersonDeleteView(DestroyAPIView):
    serializer_class = PersonSerializer
    queryset = Person.objects.all()




class ReunionApiLista(ListAPIView):

    serializer_class = ReunionSeriealizer
    def get_queryset(self):
        return Reunion.objects.all()


class ReunionApiListaLink(ListAPIView):

    serializer_class = ReunionSeriealizerLink
    def get_queryset(self):
        return Reunion.objects.all()


class PersonPaginationLista(ListAPIView):
    # Lista con paginación
    
    serializer_class = PersonaSerializer
    pagination_class = PersonPagination

    def get_queryset(self):
        return Person.objects.all()
    

class ReunionByPersonJob(ListAPIView):
    serializer_class = CountReunionSerializer

    def get_queryset(self):
        return Reunion.objects.cantidad_reuniones_job()
    