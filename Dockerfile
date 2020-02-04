FROM schliflo/docker-puppeteer

USER root

RUN yarn global add \
    penthouse@2 \
    html-minifier@4 \
    request@2 \
    && yarn cache clean \
    && mkdir -p /dist \
    && fix_permissions \
    && chown -R $APPLICATION_USER:$APPLICATION_GROUP /dist

USER $APPLICATION_USER
