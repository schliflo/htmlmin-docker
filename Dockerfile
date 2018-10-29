FROM schliflo/docker-puppeteer

USER root

RUN yarn global add \
    penthouse@1 \
    html-minifier@3 \
    request@2 \
    && yarn cache clean

ENV NODE_PATH="/usr/local/share/.config/yarn/global/node_modules:${NODE_PATH}"

RUN mkdir /dist \
    && ls -lah /usr/local/share/.config/yarn/global/node_modules/puppeteer/.local-chromium/

WORKDIR /app

# Add user so we don't need --no-sandbox.
RUN mkdir -p /home/pptruser/Downloads \
    && chown -R pptruser:pptruser /home/pptruser \
    && chown -R pptruser:pptruser /usr/local/share/.config/yarn/global/node_modules \
    && chown -R pptruser:pptruser /app \
    && chown -R pptruser:pptruser /dist

# Run everything after as non-privileged user.
USER pptruser

ENTRYPOINT ["dumb-init", "--"]

# CMD ["/usr/local/share/.config/yarn/global/node_modules/puppeteer/.local-chromium/linux-526987/chrome-linux/chrome"]

CMD ["node", "index.js"]
