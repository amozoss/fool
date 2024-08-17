"use client";
import React from "react";
import { useState } from "react";
import Editor from "./components/editor/advanced-editor";
import { defaultValue } from "./default-value";

export default function EditorWrapper() {
  const [value, setValue] = useState(defaultValue);
  return <Editor initialValue={value} onChange={setValue} />;
}
