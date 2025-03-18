import Home from './components/Home';
import Detail from './components/Detail';
import Change from './components/Change';

export default {
    mode: 'history',
    routes: [
        {
            path: '/',
            component: Home
        },
        {
            path: '/detail/:id',
            name: 'detail',
            component: Detail
        },
        {
            path: '/change/:title/:id',
            name: 'change',
            component: Change
        }

    ]

}