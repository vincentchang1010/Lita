package com.dehats.sqla.model {
import mx.controls.Alert;
import mx.controls.FlexNativeMenu;

import com.dehats.sqla.model.presentation.MainPM;

import flash.desktop.NativeApplication;
import flash.display.NativeMenuItem;
import flash.events.Event;

import mx.events.FlexNativeMenuEvent;

public class NativeMenuManager {

    private var pm:MainPM;
    private var nativeApp:NativeApplication;

    public function NativeMenuManager(pPM:MainPM, pNativeApp:NativeApplication) {
        pm = pPM;
        nativeApp = pNativeApp;
    }


    public function createMenu():FlexNativeMenu {

        var menuDefinition:XML =
                <root>
                    <AppMenu label="Lita">
                        <menuitem command="HelpCommand" label='Online Help'/>
                        <menuitem command="AboutCommand" label='About Lita'/>
                        <menuitem command="QuitCommand" label='Quit Lita' equiv='q'/>
                    </AppMenu>

                    <FileMenu label='File'>
                        <menuitem command="OpenCommand" label='Open Database File' equiv='o'/>
                        <menuitem command="CreateCommand" label='Create New Database File' equiv='n'/>
                    </FileMenu>

                    <DBMenu label='Database'>
                        <menuitem command="ExportStructCommand" label='Export Database'/>
                        <menuitem command="CompactCommand" label='Compact Database'/>
                        <menuitem command="EncryptCommand" label='Encrypt / Reencrypt Database'/>
                    </DBMenu>

                    <EditMenu label='Edit'>
                        <menuitem command="CopyCommand" label='Copy' equiv='c'/>
                        <menuitem command="PasteCommand" label='Paste' equiv='v'/>
                        <menuitem command="CutCommand" label='Cut' equiv='x'/>
                        <menuitem command="SelectAllCommand" label='Select All' equiv='a'/>
                    </EditMenu>

                </root>;

        var root:FlexNativeMenu = new FlexNativeMenu();
        root.showRoot = false;
        root.labelField = "@label";
        root.dataProvider = menuDefinition;

        root.addEventListener(FlexNativeMenuEvent.ITEM_CLICK, onMenuSelect);

        return root;
    }

    private function onMenuSelect(pEvt:FlexNativeMenuEvent):void {

        var item:NativeMenuItem = pEvt.nativeMenuItem;
        switch (item.data.@command[0].toString()) {


            case "HelpCommand":
                    Alert.show('Not available!');
//                pm.goToHelp();
                break;


            case "QuitCommand":
                pm.closeApp();
                break;

            case "AboutCommand":
                pm.promptAboutDialog();
                break;

            case "OpenCommand":
                pm.promptOpenFile();
                break;

            case "CreateCommand":
                pm.promptCreateDBFile();
                break;

            case "CompactCommand":
                pm.compact();
                break;

            case "EncryptCommand":
                pm.promptReencrypt();
                break;

            case "ExportStructCommand":
                pm.exportDB();
                break;

            case "CopyCommand":
                nativeApp.copy();
                break;

            case "PasteCommand":
                nativeApp.paste();
                break;

            case "CutCommand":
                nativeApp.cut();
                break;

            case "SelectAllCommand":
                nativeApp.selectAll();
                break;

            default:
                break;
        }
    }

}
}