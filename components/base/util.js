
export default {
  createTag: function(tagName, componentName, opts){
    return riot.mount(document.createElement(tagName), componentName, opts)[0]
  },
  getContent: function(tagOrElement){
    return (tagOrElement instanceof Element)
      ? tagOrElement : (tagOrElement instanceof riot.Tag)
      ? tagOrElement.root : document.createTextNode(String(tagOrElement));
  },
};
