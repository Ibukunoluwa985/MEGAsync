#ifndef ADDEXCLUSIONDIALOG_H
#define ADDEXCLUSIONDIALOG_H

#include <QDialog>
#include "HighDpiResize.h"

namespace Ui {
class AddExclusionDialog;
}

class AddExclusionDialog : public QDialog
{
    Q_OBJECT

public:
    explicit AddExclusionDialog(QWidget *parent = 0);
    ~AddExclusionDialog();
    QString textValue();

private slots:
    void on_bOk_clicked();
    void on_bChoose_clicked();

#ifndef __APPLE__
    void on_bChooseFile_clicked();
#endif

protected:
    void changeEvent(QEvent * event);

private:
    Ui::AddExclusionDialog *ui;
    HighDpiResize highDpiResize;
};

#endif // ADDEXCLUSIONDIALOG_H
