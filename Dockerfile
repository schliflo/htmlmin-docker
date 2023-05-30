FROM schliflo/docker-puppeteer

RUN npm install \
        @hokify/penthouse@2 \
        html-minifier-terser@7 \
    && npm cache clean --force
