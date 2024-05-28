FROM alpine:3.20

ARG SECRET_VALUE="undefined"

RUN echo "yyy"
RUN echo ${SECRET_VALUE}
# You can combine environment variables and build arguments to allow
# environment variables to be configured at build-time. source:
# https://docs.docker.com/build/building/variables/#environment-variables
ENV SECRET_VALUE=${SECRET_VALUE}
RUN echo "xxx"
RUN echo ${SECRET_VALUE}

# Check if the env is undefined and terminate build if true
RUN if [ "${SECRET_VALUE}" = "undefined" ] || [ "${SECRET_VALUE}" = "" ]; then exit 1; fi

RUN echo "---"
RUN echo "Parsing secret value from ARG: ${SECRET_VALUE}"
RUN echo "---"
RUN echo ${SECRET_VALUE}
RUN echo "---"
