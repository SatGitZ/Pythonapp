FROM python:3.9
WORKDIR /app
RUN pip install -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["appy.py", "python"]
