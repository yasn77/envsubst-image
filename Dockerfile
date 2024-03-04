FROM jdxcode/mise AS BUILD
COPY .tool-versions .tool-versions
RUN mise install -y


FROM scratch
COPY --from=BUILD /mise/installs/envsubst/1.4.2/bin/envsubst /usr/bin/envsubst
ENTRYPOINT ["/usr/bin/envsubst"]
CMD ["--help"]
