export function getMetaValue(name) {
  const element = findElement(document.head, `meta[name="${name}"]`)
  if (element) {
    return element.getAttribute("content")
  }
}

export function findElements(root, selector) {
  if (typeof root == "string") {
    selector = root
    root = document
  }
  const elements = root.querySelectorAll(selector)
  return toArray(elements)
}

export function findElement(root, selector) {
  if (typeof root == "string") {
    selector = root
    root = document
  }
  return root.querySelector(selector)
}

export function dispatchEvent(element, type, eventInit = {}) {
  const { disabled } = element
  const { bubbles, cancelable, detail } = eventInit
  const event = document.createEvent("Event")

  event.initEvent(type, bubbles || true, cancelable || true)
  event.detail = detail || {}

  try {
    element.disabled = false
    element.dispatchEvent(event)
  } finally {
    element.disabled = disabled
  }

  return event
}

export function toArray(value) {
  if (Array.isArray(value)) {
    return value
  } else if (Array.from) {
    return Array.from(value)
  } else {
    return [].slice.call(value)
  }
}

export function onDocumentReady(callback) {
  if (document.readyState !== "loading") {
      callback()
  } else {
      document.addEventListener("DOMContentLoaded", callback)
  }
}

export function removeElement(el) {
  if (el && el.parentNode) {
    el.parentNode.removeChild(el)
  }
}

export function insertAfter(el, referenceNode) {
  return referenceNode.parentNode.insertBefore(el, referenceNode.nextSibling)
}

export function getAuthenticityToken() {
  return getMetaValue("csrf-token")
}

export function rFetch(resource, _options = {}) {
  const options = Object.assign({}, _options)
  
  setupHeaders()
  setupContentType()
  setupAccept()
  setupCredentials()  
  return fetch(resource, options).then(checkStatus).then(parseResponse)
  
  function setupHeaders() {
    const headers = Object.assign({}, options.headers)
    headers["X-CSRF-Token"] = getAuthenticityToken()  
    headers["X-Requested-With"] = "XMLHttpRequest"
    options.headers = headers
  }
  
  function setupContentType() {  
    if (options.contentType) options.headers["Content-Type"] = options.contentType
  }
  
  function setupAccept() {
    if (options.as == "json") {
      options.headers["Accept"] = "application/json"
    } 
    if (options.as == "xhr") {
      options.headers["Accept"] = "text/javascript"
    }
  }
  
  function setupCredentials() {
    options.credentials = options.credentials || "same-origin"
  }
  
  function checkStatus(response) {
    if (response.status >= 200 && response.status < 300) {
      return response
    } else {
      const error = new Error(response.statusText)
      error.response = response
      throw error
    }
  }
  
  function parseResponse(response) {
    switch (options.as) {
      case "blob":
        return response.blob();
      case "json":
        return response.json();
      default:
        return response.text()
    }
  }  
}
