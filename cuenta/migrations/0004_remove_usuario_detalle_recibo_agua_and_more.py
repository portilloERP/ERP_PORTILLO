# Generated by Django 4.2.2 on 2023-07-10 02:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cuenta', '0003_remove_usuario_detalle_a_judiciales_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usuario_detalle',
            name='recibo_agua',
        ),
        migrations.RemoveField(
            model_name='usuario_detalle',
            name='recibo_luz',
        ),
    ]
