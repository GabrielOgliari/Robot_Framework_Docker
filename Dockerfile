FROM python:alpine3.17

WORKDIR /robot

COPY /api/api.robot /robot/

RUN pip install robotframework && pip install robotframework-seleniumlibrary && pip install robotframework-requests && pip install robotframework--faker

CMD robot -d results ./api.robot && sleep 5 




