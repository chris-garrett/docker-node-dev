import clone from 'clone';

const a = { foo: { bar: 'baz' } };
const b = clone(a);

a.foo.bar = 'foo';            // change a

console.log('a', a);
console.log('b', b);
