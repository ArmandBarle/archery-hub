import os


class Config:
    SQLALCHEMY_DATABASE_URI = 'postgresql://archery_user:your_password@localhost:5432/archery_club'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
