FROM schliflo/docker-puppeteer

RUN yarn global add \
        penthouse@2 \
        html-minifier@4 \
        request@2 \
    && yarn cache clean
