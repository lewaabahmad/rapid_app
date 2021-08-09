import CodeMirror from 'codemirror/lib/codemirror.js';
import 'codemirror/mode/htmlmixed/htmlmixed.js';

document.addEventListener("turbolinks:load", function() {
  CodeMirror.fromTextArea(document.getElementById("code-area"), {
    lineNumbers: true,
    mode: "htmlmixed",
    theme: 'oceanic-next',
    tabSize: 2
  });
})
