"use strict";

const taskLists = require('markdown-it-task-lists');

exports.activate = function activate() {
  return {
    extendMarkdownIt(markdownIt) {
      return markdownIt.use(taskLists, { enabled: true });
    }
  };
};

exports.deactivate = function deactivate() {};