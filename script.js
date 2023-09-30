import { Chuck } from 'https://cdn.jsdelivr.net/npm/webchuck/+esm';

const editor = newChuckEditor('editor');
editor.setValue(await (await fetch('./demo.ck')).text(), 1);

const states = Object.freeze({
  playing: 0,
  stopped: 1
});
let status = states.stopped;

let chuck;
const action = document.getElementById('action');
action.addEventListener('click', async () => {
  action.innerHTML = `
    <div class="spinner-border" role="status">
      <span class="visually-hidden">Loading...</span>
    </div>
  `;

  // NOTE: See https://developer.mozilla.org/en-US/docs/Web/Media/Autoplay_guide#autoplay_using_the_web_audio_api
  //       for more detail about why we initialize webchuck here.
  chuck ??= await Chuck.init([]);

  switch (status) {
    case states.playing:
      status = states.stopped;

      chuck.removeLastCode();

      action.classList.remove('btn-outline-danger');
      action.classList.add('btn-outline-success');

      action.innerHTML = await (await fetch('icons/play.svg')).text();
      break;
    case states.stopped:
      status = states.playing;

      chuck.runCode(editor.getValue());

      action.classList.remove('btn-outline-success');
      action.classList.add('btn-outline-danger');

      action.innerHTML = await (await fetch('icons/stop.svg')).text();
      break;
  }
});
