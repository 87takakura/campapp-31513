# syntax=docker/dockerfile:1
FROM ruby:2.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs
#RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp
#WORKDIR /var/www
COPY Gemfile /myapp/Gemfile
COPY ./app /myapp

RUN bundle config --local set path 'vender/bundle'
RUN bundle install


CMD ["bundle", "exec", "ruby", "app.rb"]



#COPY Gemfile /myapp/Gemfile



#COPY Gemfile.lock /myapp/Gemfile.lock
#RUN bundle install
#COPY ../compose /myapp

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000

# Configure the main process to run when running the image

#CMD ["rails", "server", "-b", "0.0.0.0"]