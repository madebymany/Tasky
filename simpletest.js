
var target = UIATarget.localTarget();

target.frontMostApp().navigationBar().rightButton().tap();
target.frontMostApp().mainWindow().textFields()["TaskTitleField"].tap();
target.frontMostApp().mainWindow().textFields()["TaskTitleField"].tap();
target.frontMostApp().mainWindow().textViews()["TaskDetailsField"].tapWithOptions({tapOffset:{x:0.11, y:0.10}});
target.frontMostApp().keyboard().typeString("\n");
target.frontMostApp().mainWindow().buttons()["SaveTaskButton"].tap();
