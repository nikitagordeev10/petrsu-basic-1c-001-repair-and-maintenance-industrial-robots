#language: ru

@tree

Функционал: <описание фичи>

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: <описание сценария>
Когда В панели разделов я выбираю "Управление торговлей"
И В панели разделов я выбираю "Управление производством"
И В командном интерфейсе я выбираю "Управление торговлей" "Цены на продукцию"
Тогда открылось окно "Цены на продукцию"
И я нажимаю на кнопку с именем 'ФормаСформировать'
