# Generated by Django 4.2.2 on 2023-08-23 15:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marketing', '0006_alter_campania_estado'),
    ]

    operations = [
        migrations.AlterField(
            model_name='campania',
            name='coste_estimado',
            field=models.FloatField(default=0),
        ),
        migrations.AlterField(
            model_name='campania',
            name='coste_real',
            field=models.FloatField(default=0),
        ),
    ]
