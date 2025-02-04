from rest_framework import serializers, pagination
from .models import Person, Reunion, Hobby

class PersonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = (
            '__all__'
        )

class PersonaSerializer(serializers.Serializer):
    id = serializers.IntegerField()
    full_name = serializers.CharField()
    job = serializers.CharField()
    email = serializers.EmailField()
    phone = serializers.CharField()
    
    #
    activo = serializers.BooleanField(required=False)


class PersonaSerializer2(serializers.ModelSerializer):
    
    activo = serializers.BooleanField(default=False)
    
    class Meta:
        model = Person
        fields = (
            '__all__'
        )

class ReunionSeriealizer(serializers.ModelSerializer):
    persona = PersonaSerializer()

    class Meta:
        model = Reunion
        fields = (
            'id',
            'fecha',
            'asunto',
            'persona',
            )
        

# class HobbySerializer(serializers.ModelSerializer):
    
#     class Meta:
#         model = Hobby
#         fields = ('__all__')

# class PersonaSerializer3(serializers.ModelSerializer):
    
#     hobbies = HobbySerializer(many=True)

#     class Meta:
#         model = Person
#         fields = (
#             'id',
#             'full_name',
#             'job',
#             'email',
#             'phone',
#             'hobbies',
#             'created',
#         )

# class PersonaSerializer4(serializers.ModelSerializer):
#     hobbies = serializers.StringRelatedField(many=True, required=False)
#     class Meta:
#         model = Person
#         fields = ('id', 'full_name', 'job', 'email', 'phone', 'hobbies', 'created')

#     def create(self, validated_data):
#         hobbies_data = validated_data.pop('hobbies', []) # Obtén los hobbies del JSON
#         person = Person.objects.create(**validated_data) # Crea la persona

#         for hobby_name in hobbies_data:
#             hobby, created = Hobby.objects.get_or_create(hobby=hobby_name) # crea o obtén el hobby
#             person.hobbies.add(hobby) # Asocia el hobby a la persona

#         return person


class PersonaSerializer4(serializers.ModelSerializer):
    hobbies = serializers.SerializerMethodField(read_only=True)
    hobbies_input = serializers.ListField(child=serializers.CharField(),write_only=True, required=False)
    class Meta:
        model = Person
        fields = ('id', 'full_name', 'job', 'email', 'phone', 'hobbies','hobbies_input', 'created')

    def get_hobbies(self, obj):
        # Devuelve una lista con los hobbies 
        return [hobby.hobby for hobby in obj.hobbies.all()]

    def create(self, validated_data):
        print("Datos validados", validated_data)
        hobbies_data = validated_data.pop('hobbies_input', []) # Obtén los hobbies del JSON
        print("Hobbies recibidos:") # Depuracion
        person = Person.objects.create(**validated_data) # Crea la persona

        for hobby_name in hobbies_data:
            print("Procesando hobby:", hobby_name) # Depuracion
            hobby, created = Hobby.objects.get_or_create(hobby=hobby_name) # crea o obtén el hobby
            person.hobbies.add(hobby) # Asocia el hobby a la persona

        return person


# class HobbySerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Hobby
#         fields = ['hobby']

# class HobbySerializer(serializers.ModelSerializer):
#     def to_representation(self, value):
#         return value.hobby
    
# class PersonaSerializer4(serializers.ModelSerializer):
#     hobbies = HobbySerializer(many=True, read_only=True)  

#     class Meta:
#         model = Person
#         fields = ('id', 'full_name', 'job', 'email', 'phone', 'hobbies', 'created')

#         def get_hobbies(self, obj):
#             return [hobby.hobby for hobby in obj.hobbies.all()]  


class ReunionSeriealizerLink(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Reunion
        fields = (
            'id',
            'fecha',
            'asunto',
            'persona',
            )
        extra_kwargs = {
            'persona': {'view_name': 'persona_app:detalle', 'lookup_field': 'pk'}
        }

class PersonPagination(pagination.PageNumberPagination):
    page_size = 5
    max_page_size = 100


class CountReunionSerializer(serializers.Serializer):
    persona__job = serializers.CharField()
    cantidad = serializers.IntegerField()