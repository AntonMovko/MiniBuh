
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура СформироватьОплату(Команда)
	СформироватьОплатуНаСервере();
КонецПроцедуры

&НаСервере
Процедура СформироватьОплатуНаСервере()
	НовыйОплата = Документы.Оплата.СоздатьДокумент();
	ТЗ_Оплат = Объект.НеоплаченныеРаботы.Выгрузить();
	НовыйОплата.Дата = ТекущаяДатаСеанса();
	НовыйОплата.ОплаченыеРаботы.Загрузить(ТЗ_Оплат);
	НовыйОплата.Записать(РежимЗаписиДокумента.Запись);
КонецПроцедуры

&НаКлиенте
Процедура Обновить(Команда)
	ОбновитьНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОбновитьНаСервере()
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ВзаиморасчетыОстатки.Заявка,
		|	ВзаиморасчетыОстатки.ВидРабот,
		|	ВзаиморасчетыОстатки.ЧеловекоЧасыОстаток КАК ЧеловекоЧасы,
		|	ВзаиморасчетыОстатки.СтоимостьРаботОстаток КАК СтоимостьРабот
		|ИЗ
		|	РегистрНакопления.Взаиморасчеты.Остатки КАК ВзаиморасчетыОстатки";
	
	ТЗ_РезультатЗапроса = Запрос.Выполнить().Выгрузить();
	
	Объект.НеоплаченныеРаботы.Загрузить(ТЗ_РезультатЗапроса);
	
КонецПроцедуры



&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ОбновитьНаСервере();
КонецПроцедуры

#КонецОбласти