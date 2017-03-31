include:
  - node

yarn-repo-key:
  cmd.run:
    - name: rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
    - unless: rpm -qi gpg-pubkey-6963f07f

yarn-repo:
  pkgrepo.managed:
    - humanname: Yarn Repository
    - baseurl: https://dl.yarnpkg.com/rpm/
    - gpgcheck: 1
    - gpgkey: https://dl.yarnpkg.com/rpm/pubkey.gpg
    - require:
      - cmd: yarn-repo-key

yarn:
  pkg.installed:
    - name: yarn
    - require:
      - pkgrepo: yarn-repo
