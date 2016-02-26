// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file
 * (and should create it if it does not exist).
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 * Example :
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    $([IPython.events]).on('app_initialized.NotebookApp', function(){
 *        IPython.toolbar.add_buttons_group([
 *            {
 *                 'label'   : 'run qtconsole',
 *                 'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                 'callback': function () {
 *                     IPython.notebook.kernel.execute('%qtconsole')
 *                 }
 *            }
 *            // add more button here if needed.
 *            ]);
 *    });
 *
 * Example :
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */

// $.getScript("/static/components/codemirror/keymap/emacs.js", function() {
// if (! IPython.Cell) return;
// IPython.Cell.options_default.cm_config.keyMap = "emacs";
// });



// $([IPython.events]).on('app_initialized.NotebookApp', function(){

//     require(['custom/spellchecker/main'],function(spellchecker){
//         // spellchecker.parameters('just a dummy argument to pass if necessary');
//         spellchecker.parameters('dummy');
//         console.log('Spellcheck extension loaded correctly');
//     });

// });

// /* Add a button for publishing IPython notebook as GitHub gist */

// IPython.load_extensions('gist');

// // register a callback when the IPython.notebook instance is created.
// $([IPython.events]).on('app_initialized.NotebookApp', function(){
// 	function to(mode) {
// 		// this can be either 'vim' or 'emacs'
// 		var mode = mode || 'emacs';
// 		// first let's apply mode to all current cells
// 		function to_mode(c) { return c.code_mirror.setOption('keyMap', mode);};
// 		var cells = IPython.notebook.get_cells();
// 		if (cells != null) {
// 			cells.map(to_mode);
// 		}

// 		// apply the mode to future cells created
// 		IPython.Cell.options_default.cm_config.keyMap = mode;
// 	};
// 	require(["codemirror/keymap/emacs"],
// 			function (_) {
// 				if (IPython.notebook != undefined) {
// 					to('emacs');
// 				};
// 			});
// });

IPython.load_extensions('calico-spell-check', 'calico-document-tools', 'calico-cell-tools');
