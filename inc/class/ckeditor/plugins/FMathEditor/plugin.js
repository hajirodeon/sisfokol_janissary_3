CKEDITOR.plugins.add( 'FMathEditor', {
    icons: 'FMathEditor',
    init: function( editor ) {
		editor.addCommand( 'viewMathEditor', new CKEDITOR.dialogCommand( 'FMathEditorDialog' ) );

		editor.ui.addButton( 'FMathEditor', {
		    label: 'Math Editor',
		    command: 'viewMathEditor',
		    toolbar: 'insert'
		});

		if ( editor.contextMenu ) {
            editor.addMenuGroup( 'mathGroup' );
            editor.addMenuItem( 'mathEditorItem', {
                label: 'Edit Math',
                icon: this.path + 'icons/FMathEditor.png',
                command: 'viewMathEditor',
                group: 'mathGroup'
            });

            editor.contextMenu.addListener( function( element ) {
                if ( element.getAscendant( 'img', true ) ) {
                    return { mathEditorItem: CKEDITOR.TRISTATE_OFF };
                }
            });
        }

		CKEDITOR.dialog.add( 'FMathEditorDialog', this.path + 'dialogs/dialog.js' );
    }
});
