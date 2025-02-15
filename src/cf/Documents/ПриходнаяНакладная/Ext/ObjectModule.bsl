﻿Процедура ПриУстановкеНовогоНомера(СтандартнаяОбработка, Префикс) 
	Префикс = ОбменСервер.ПолучитьПрефиксНомера(); 
КонецПроцедуры 


Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	
	Движения.ОстаткиНоменклатуры.Записывать = Истина;
	Движения.СтоимостьНоменклатуры.Записывать = Истина;
	Движения.Управленческий.Записывать = Истина;
	
	Для Каждого ТекСтрокаПриход Из ПереченьНоменклатуры Цикл
		
		// регистр ОстаткиПродуктов Приход
		Движение = Движения.ОстаткиНоменклатуры.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаПриход.Номенклатура;
		Движение.НаборСвойств = ТекСтрокаПриход.НаборСвойств; 
		Движение.ОбъектПредприятия = ОбъектПредприятия;
		Движение.Количество = ТекСтрокаПриход.Количество;
		
		// регистр СтоимостьПродуктов Приход
		Движение = Движения.СтоимостьНоменклатуры.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаПриход.Номенклатура;
		Движение.Стоимость = ТекСтрокаПриход.Сумма;
		
		//регистр Управленческий Движение = Движения.Управленческий.Добавить(); 
		Движение = Движения.Управленческий.Добавить();
		Движение.СчетДт = ПланыСчетов.Основной.Товары;
		Движение.СчетКт = ПланыСчетов.Основной.РасчетыСПоставщиками;
		Движение.Период = Дата; 
		Движение.Сумма = ТекСтрокаПриход.Сумма; 
		Движение.КоличествоДт = ТекСтрокаПриход.Количество;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Номенклатура] = ТекСтрокаПриход.Номенклатура; 
		
	КонецЦикла;
	
КонецПроцедуры
