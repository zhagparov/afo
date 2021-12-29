<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<#import "parts/pager.ftl" as p>
<@c.page>

<a class="btn btn-primary mb-3" href="/enrollee/enrolleeAdd/stay">Добавить</a>
<div class="container">
    <div class="row mt-2">
        <div class="col-10">
            <form method="get" action="${url}" class="row row-cols-lg-auto g-3 align-items-center">
                <div class="form-group col-md-7">
                    <div class="input-group">
                        <input class="form-control" type="text" name="filter" value="${filter?ifExists}"
                               placeholder="Поиск по ИИН/ФИО">
                    </div>
                </div>
                <div>
                    <button class="btn btn-primary" type="submit">Поиск</button>
                </div>
        </div>
        </form>
        <div class="col">
            <form method="get" action="${url}" class="row row-cols-lg-auto g-3 align-items-center">
                <select class="form-select bg-size" name="sort" id="sort" onchange="this.form.submit()">
                    <option value="createdAt,DESC" <#if pageSort == "createdAt,DESC">selected</#if>>Дата создания по убыванию</option>
                    <option value="createdAt,ASC" <#if pageSort=="createdAt,ASC">selected</#if>>Дата создания по возрастанию</option>
                    <option value="fio,DESC" <#if pageSort=="fio,DESC">selected</#if>>ФИО по убыванию</option>
                    <option value="fio,ASC" <#if pageSort=="fio,ASC">selected</#if>>ФИО по возрастанию</option>
                    <option value="updatedAt,DESC" <#if pageSort=="updatedAt,DESC">selected</#if>>Дата изменения по убыванию</option>
                    <option value="updatedAt,ASC" <#if pageSort=="updatedAt,ASC">selected</#if>>Дата изменения по возрастанию</option>
                    <option value="iin,DESC" <#if pageSort=="iin,DESC">selected</#if>>ИИН по убыванию</option>
                    <option value="iin,ASC" <#if pageSort=="iin,ASC">selected</#if>>ИИН по возрастанию</option>
                </select>
            </form>
        </div>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ФИО</th>
            <th>ИИН</th>
            <th>Учебное заведение</th>
            <th>Образовательная программа</th>
            <th>Телефон</th>
            <th>Email</th>
            <th>Дата создания</th>
            <th>Задачи</th>
            <#if isAdmin || isKurator>
            <th>Профоринтатор</th>
            </#if>
            <th>Действие</th>
        </tr>
        </thead>
        <tbody>
    <#list page.content as enrollee>
    <tr>
        <td>${enrollee.fio?ifExists}</td>
        <td>${enrollee.iin?ifExists}</td>
        <td>${enrollee.university?ifExists}</td>
        <td>${enrollee.educationProgramm.getNameEducation()?ifExists}</td>
        <td>${enrollee.phone?ifExists}</td>
        <td>${enrollee.email?ifExists}</td>
        <td>${enrollee.getFormatCreatedAt()?ifExists}</td>
        <td><a class="btn btn-warning" href="/task/enrolles/${enrollee.id}">Просмотреть задачи</a></td>
        <#if isAdmin || isKurator>
            <td>${enrollee.getCareerCounselor().fio?ifExists}</td>
        </#if>
        <td><a class="btn btn-outline-info" href="/enrollee/${enrollee.id}">Редактировать</a></td>
    </tr>
    </#list>
        </tbody>

    </table>

    <@p.pager url page/>
</@c.page>