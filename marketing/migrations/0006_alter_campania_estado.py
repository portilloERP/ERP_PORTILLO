# Generated by Django 4.2.2 on 2023-08-22 16:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marketing', '0005_alter_campania_estado_alter_campania_proyecto_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='campania',
            name='estado',
            field=models.CharField(blank=True, choices=[('A', 'Activo'), ('I', 'Inactivo'), ('E', 'Eliminado')], default='A', max_length=20, null=True),
        ),
    ]