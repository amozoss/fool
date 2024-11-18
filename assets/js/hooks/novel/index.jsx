import React from "react";
import { lazy } from "react";

import { createRoot } from "react-dom/client";

const Editor = lazy(() => import("./advanced-editor"));

export default {
  _rootEl: null,

  mounted() {
    // create react root element
    const rootEl = document.getElementById(this.el.id);
    this._rootEl = createRoot(rootEl);

    this.pushEvent("editor-html", {}, (reply, ref) => {
      this.render(reply.html); // render component with empty data
    });
  },

  update() {
    if (this._rootEl) {
      render(this._rootEl);
    }
  },

  destroyed() {
    if (!this._rootEl) return;
    this._rootEl.unmount();
  },

  render(html) {
    this._rootEl.render(
      <React.StrictMode>
        <Editor content={html} pushEvent={this.pushEvent.bind(this)} />
      </React.StrictMode>
    );
  },
};
