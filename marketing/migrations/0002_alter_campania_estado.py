# Generated by Django 4.2.2 on 2023-08-17 19:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marketing', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='campania',
            name='estado',
            field=models.CharField(choices=[('A', 'Activo'), ('I', 'Inactivo'), ('E', 'Eliminado')], default='A', max_length=100, null=True),
        ),
    ]