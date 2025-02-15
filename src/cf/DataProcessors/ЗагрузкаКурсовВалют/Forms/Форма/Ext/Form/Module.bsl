﻿
&НаКлиенте
Процедура ПолучитьВалюты(Команда)
	Если НЕ ЗначениеЗаполнено(ДатаЗагрузки) Тогда
		Сообщить("Не выбрана дата загрузки!", СтатусСообщения.Важное);
		Возврат;
	КонецЕсли;   
	ТаблицаКурсовВалют.Очистить();
	ЗагрузитьКурсыВалют(ДатаЗагрузки);
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьКурсыВалют(ДатаЗагрузки)	
	Прокси = WSСсылки.КурсыВалютССайтаЦБ.СоздатьWSПрокси("http://web.cbr.ru/", "DailyInfo", "DailyInfoSoap");
	ТипWSПараметра = Прокси.ФабрикаXDTO.Пакеты.Получить("http://web.cbr.ru/").Получить("GetCursOnDate");
	WSПараметр = Прокси.ФабрикаXDTO.Создать(ТипWSПараметра);
	WSПараметр.On_Date = ДатаЗагрузки;
	КурсыВалют = Прокси.GetCursOnDate(WSПараметр);
	Для каждого Элемент Из КурсыВалют.GetCursOnDateResult.diffgram.ValuteData.ValuteCursOnDate Цикл 
		НоваяСтрокаТЗ = ТаблицаКурсовВалют.Добавить(); // Добавление в табличную часть данных.
		НоваяСтрокаТЗ.НазваниеВалюты = Элемент.Vname; // Добавление в столбец "НазваниеВалюты" элемента с сайта Vname 		
		НоваяСтрокаТЗ.Номинал = Элемент.Vnom; 
		НоваяСтрокаТЗ.ЦифровойКодВалюты = Элемент.Vcode;		
		НоваяСтрокаТЗ.СимвольныйКодВалюты = Элемент.VChCode;		
		НоваяСтрокаТЗ.КурсВалюты = Элемент.Vcurs;   
		
		РегКурсыВалют = РегистрыСведений.КурсыВалют.СоздатьМенеджерЗаписи();
		РегКурсыВалют.Период = ДатаЗагрузки;
		РегКурсыВалют.НазваниеВалюты = Элемент.Vname;
		РегКурсыВалют.Номинал = Элемент.Vnom;
		РегКурсыВалют.ЦифровойКодВалюты = Элемент.Vcode;
		РегКурсыВалют.СимвольныйКодВалюты = Элемент.VChCode;
		РегКурсыВалют.КурсВалюты = Элемент.Vcurs;
		РегКурсыВалют.Записать(Истина);
	КонецЦикла; 
	
КонецПроцедуры
