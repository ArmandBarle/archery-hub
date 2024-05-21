from flask import render_template, flash, redirect, url_for
from app import create_app, db

app = create_app()


@app.route('/')
def index():
    return "Hello, World!"
