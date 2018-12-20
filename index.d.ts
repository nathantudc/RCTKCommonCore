
type JSuccessCallback<T = undefined> = (result: T) => void
type JFailCallback = (result: { errorCode: number }) => void
type JResultCallback<T = undefined> = (result: T) => void
declare class KCore {
    static sayHello(): void
    static fingerprint(
        destription: string,
        callback: JSuccessCallback<{ code: string }> | JResultCallback<{ code: string }>
      ): void
}