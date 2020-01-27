# Module 1 GIT, Docker.

## TASK 1.1 GIT.

#### 1. Установите git и сгенерируйте пару ssh ключей. Авторизуйте публичный ключ на github.com.

    ssh-keygen -t rsa -b 2048

![something going wrong](https://user-images.githubusercontent.com/22638433/73187492-28f81400-412a-11ea-948f-f001c78b2627.png)


#### 2. Укажите свой user.name и user.email в git.

    git config --global user.name "Reorks9"
    git config --global user.email Reorks9@gmail.com


#### 3. Создайте новый репозиторий на github.com и склонируйте его локально на свой компьютер.

![something going wrong](https://user-images.githubusercontent.com/22638433/73187493-28f81400-412a-11ea-889f-d509229ed116.png)


#### 4. Создайте файл названием song.txt и поместите туда половину текста любимой песни.

![something going wrong](https://user-images.githubusercontent.com/22638433/73187494-28f81400-412a-11ea-8ae2-ce052e25ad03.png)


#### 5. Сделайте коммит с названием "add first half of my favorite song" и отправьте его на сервер.

    git add .
    git commit -m "add first half of my favorite song"
    git push origin --all

![something going wrong](https://user-images.githubusercontent.com/22638433/73187496-2990aa80-412a-11ea-8032-ffb1e9ca3fdb.png)


#### 6. Убедитесь что на github есть файл song.txt с текстом песни.

![something going wrong](https://user-images.githubusercontent.com/22638433/73187497-2990aa80-412a-11ea-80e6-6c82334e2523.png)


#### 7. Используя веб-интерфейс гитхаба добавьте вторую половину текста песни и сделайте коммит с названием "finish my song".

![something going wrong](https://user-images.githubusercontent.com/22638433/73187498-2990aa80-412a-11ea-88fc-d84ec767c16a.png)


#### 8. В локальном репозитории сделайте pull и убедитесь что коммит, который вы создали на github, подтянулся и у вас полный текст песни.

    git pull

![something going wrong](https://user-images.githubusercontent.com/22638433/73187500-2a294100-412a-11ea-8a3e-1dbc56b58a8d.png)

All commit on repo.

![something going wrong](https://user-images.githubusercontent.com/22638433/73187500-2a294100-412a-11ea-8a3e-1dbc56b58a8d.png)
