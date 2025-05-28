type props = {
  title: string,
  subtitle?: string,
  children: React.element,
  dialogRef: React.ref<Nullable.t<Dom.element>>,
}

let make = ({title, ?subtitle, children, dialogRef}) => {
  <dialog ref={ReactDOM.Ref.domRef(dialogRef)} className="dialog">
    <h2> {React.string(title)} </h2>
    <h3> {Option.mapOr(subtitle, React.null, React.string)} </h3>
    {children}
  </dialog>
}
