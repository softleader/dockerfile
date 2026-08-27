FROM node:24-bookworm-slim

# pi-coding-agent 需 bash/git/ripgrep；以 0.84.3 pin 版降低供應鏈漂移，Trivy 掃描前請先更版此處
RUN apt-get update \
  && apt-get install -y --no-install-recommends bash ca-certificates curl git gnupg ripgrep \
  && mkdir -p -m 755 /etc/apt/keyrings \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get update \
  && apt-get install -y --no-install-recommends gh \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g --ignore-scripts @earendil-works/pi-coding-agent@0.84.3 \
  && npm cache clean --force \
  && useradd -m -u 10001 -s /bin/bash pi \
  && mkdir -p /workspace /home/pi/.pi/agent \
  && chown -R pi:pi /workspace /home/pi

USER pi
WORKDIR /workspace
ENV PI_CODING_AGENT_DIR=/home/pi/.pi/agent

RUN --mount=type=secret,id=GH_TOKEN,uid=10001 \
    --mount=type=secret,id=GITHUB_TOKEN,uid=10001 \
  GH_TOKEN_VAL="$(cat /run/secrets/GH_TOKEN 2>/dev/null || cat /run/secrets/GITHUB_TOKEN 2>/dev/null || true)" \
  && if [ -n "$GH_TOKEN_VAL" ]; then \
       git config --global url."https://${GH_TOKEN_VAL}@github.com/".insteadOf "https://github.com/"; \
     fi \
  && npx --yes skills add softleader/agent-skills -g -y -a pi \
  && if [ -n "$GH_TOKEN_VAL" ]; then \
       git config --global --unset url."https://${GH_TOKEN_VAL}@github.com/".insteadOf; \
     fi \
  && npm cache clean --force

ENTRYPOINT ["pi"]
