export function converttoSVG(b64String: string): string {
    b64String = b64String.replace("data:image/svg+xml;base64,", "")
    const decoded = atob(b64String);
    return decoded
}

export function base64ToJson(base64String: string)  {
    const json = Buffer.from(base64String, "base64").toString();
    return JSON.parse(json);
}