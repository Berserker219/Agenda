from django.urls import path,re_path
from . import views

app_name = 'persona_app'

urlpatterns = [
    path('personas/',views.ListaPersonas.as_view(),name='personas'),
    path('api/persona/lista/',views.PersonListApiView.as_view(),),
    path('lista/',views.PersonListView.as_view(),name='lista'),
    path('api/persona/search/<kword>/',views.PersonSearchApiView.as_view(),),
    path('api/persona/create/', views.PersonCreateView.as_view()),
    path('api/persona/detail/<pk>/',views.PersonDetailView.as_view(), name='detalle'),
    path('api/persona/delete/<pk>/',views.PersonDeleteView.as_view()),
    path('api/persona/update/<pk>/',views.PersonUpdateView.as_view()),
    path('api/persona/modificar/<pk>/',views.PersonRetrieveUpdateView.as_view()),
    path('api/personas/',views.PersonApiLista.as_view()),
    path('api/reuniones/',views.ReunionApiLista.as_view()),
    path('api/reuniones-link/',views.ReunionApiListaLink.as_view()),
    path('api/personas/paginacion/',views.PersonPaginationLista.as_view()),
    path('api/reunion/por-job/',views.ReunionByPersonJob.as_view()),
]