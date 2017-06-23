FROM grouptree/wkhtmltopdf-service

USER root

RUN apt-get update && \
    apt-get install locales && \
    rm -rf /var/lib/apt/lists/*

# Ensure we can use UTF-8 characters like the copyright sign, in e.g. a PDF
# header or footer.
RUN sed -i 's/^# *\(nl_BE.UTF-8\)/\1/' /etc/locale.gen && locale-gen
RUN echo "LANGUAGE=nl_BE.UTF-8" >> /etc/default/locale
RUN echo "LANG=nl_BE.UTF-8" >> /etc/default/locale

USER appuser
