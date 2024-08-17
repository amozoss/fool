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

    this.render([]); // render component with empty data

    this.handleEvent("employee:updated", ({ items }) => {
      this.render(JSON.parse(items));
    });
  },

  destroyed() {
    if (!this._rootEl) return;
    this._rootEl.unmount();
  },

  render(items) {
    this._rootEl.render(
      <React.StrictMode>
        <Editor />
      </React.StrictMode>
    );
  },
};
