FROM ruby:3.3.6

# 必要パッケージ
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

# yarn（RailsのJS周りで必要になることが多い）
RUN npm install -g yarn

WORKDIR /app

# bundler + gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Rails CLI をコンテナ内で確実に使えるようにする（Issue #6 ではこれが強い）
RUN gem install rails -v 7.1.6

COPY . .

EXPOSE 3000

CMD ["bash", "-lc", "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p 3000"]

