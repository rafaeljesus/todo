FROM iron/ruby

ENV APP_NAME todo

WORKDIR /usr/$APP_NAME

ADD . /usr/$APP_NAME

ENTRYPOINT ["bundle", "exec", "puma", "config.ru"]
