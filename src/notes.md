# Последовательность команд для выполнения

   1. Настройка Раннера в виртуальной машине
      1. Поднимаем VM, открываем порты в VirtualBox для ssh
      2. Обновляем пакеты и программы \
      `sudo apt-get update && sudo apt-get upgrade`
      3. Устанавливаем все необходимые программы для выполнения \
      `sudo apt-get install gcc make clang-format valgrind openssh`
      4. Подключаемся к VM через SSH \
      `ssh -p 2222 <vm_username>@localhost`
      5. Устанавливаем репозиторий Gitlab runner \
      `curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash`
      6. Устанавливаем сам Gitlab Runner \
      `sudo apt-get install gitlab-runner`
      7. Регистрируем раннер `sudo gitlab-runner register`
         1. Указываем URL проекта
         2. Указываем токе проекта
         3. Добавляем имя раннера
         4. Добавляем тег раннера(его потом нужно будет указать в конфиге)
         5. Опциональное можно пропустить
         6. Среда выполнения: `shell`
      8. Запускаем раннер `sudo gitlab-runner run`. \
      Теперь все работы будут производиться в нашей VM.
   2. Настройка CICD для проекта SimpleBash
      1. Клонируем оригинальный репозиторий с SimpleBash в /src проекта с DO6_CICD
      2. В корне репозитория DO6_CICD создаем файл `.gitlab-ci.yml`
         - Прописываем stages в порядке их выполнения: (build, style, test)
         - Все скрипты со стадиями можно вынести в отдельные файлы. Артифакты для билда храним 30 дней, там все интуитивно понятно
   3. Поднимаем вторую машину
   4. Настраиваем соединения между ними в VirtualBox(см.Linux Network).Не забываем, что нужно оставить соединение с внешним миром у машины с раннером. \
   `SSH_PRIVATE_KEY="/home/gitlab-runner/.ssh/id_rsa.pub"`

      - Runner machine
        - `ssh-keygen`
        - `ssh-copy-id -i $SSH_PRIVATE_KEY $REMOTE_USER@$REMOTE_HOST`

      - Production machine
        - присвоить root пользователю пароль
           `sudo passwd root`
        - Изменить настройки логина через root в /etc/ssh/sshd_config на PermitRootLogin `yes` \
           `sudo chown -R $REMOTE_USER /usr/local/bin` \
           `sudo chown -R 755 /usr/local/bin`

   5. Что то там с АПИ телеграма, вроде нетрудно уже
