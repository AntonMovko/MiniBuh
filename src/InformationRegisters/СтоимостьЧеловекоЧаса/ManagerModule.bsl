Функция ПолучитьСтоимостьЧаса(ДатаРасчета) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	СтоимостьЧеловекоЧасаСрезПоследних.СтоимостьЧеловекоЧаса
		|ИЗ
		|	РегистрСведений.СтоимостьЧеловекоЧаса.СрезПоследних(&ДатаРасчета,) КАК СтоимостьЧеловекоЧасаСрезПоследних";
	
	
	Запрос.УстановитьПараметр("ДатаРасчета", ДатаРасчета);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Следующий() Тогда
		Возврат Выборка.СтоимостьЧеловекоЧаса;
	Иначе
		Возврат 0;
	КонецЕсли;
	
КонецФункции