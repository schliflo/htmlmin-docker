FROM schliflo/docker-puppeteer

RUN npm i -g \
        penthouse@2 \
        html-minifier-terser@7 \
        request@2 \
    && npm cache clean --force
