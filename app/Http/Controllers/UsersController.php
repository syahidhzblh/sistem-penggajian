<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Roles;
use App\Models\Users;
use App\Models\Master\Staff;
use Auth;
use Illuminate\Foundation\Auth\User;
use Storage;

class UsersController extends Controller
{
    public function index()
    {
        $data['users'] = Users::all();
        $data['count'] = Users::count();
        return view('users.index', $data);
    }

    public function create()
    {
        $data['title'] = "Tambah User";
        return view('users.create', $data);
    }

    public function store(Request $request)
    {
        $request->validate([
            "fullname" => "required|string|max:255",
            "birthplace" => "nullable|string|max:255",
            "birthdate" => "nullable|date",
            "email" => "required|email|unique:users,email",
            "gender" => "nullable|string|max:10",
            "religion" => "nullable|string|max:50",
            "phone" => "nullable|string|max:20",
            "jabatan_id" => "nullable|string|max:20",
        ]);

        // Create the user
        $user = new User();
        $user->fullname = $request->fullname;
        $user->birthplace = $request->birthplace;
        $user->birthdate = $request->birthdate;
        $user->email = $request->email;
        $user->gender = $request->gender;
        $user->religion = $request->religion;
        $user->phone = $request->phone;
        $user->jabatan_id = $request->jabatan_id;
        // Set other user properties as needed
        $user->save();

        // Redirect back with success message
        $message = [
            'alert-type' => 'success',
            'message' => 'User created successfully.'
        ];

        return redirect()->route('users.index')->with($message);
    }

    public function update(Request $request, $id)
    {
        $users = Users::find($id);
        if ($request->has('reset')) {
            $users->update([
                'password' => bcrypt($users->username)
            ]);
        }

        $message = [
            'alert-type' => 'success',
            'message' => 'Password berhasil di-reset.'
        ];
        return redirect()->back()->with($message);
    }


    public function destroy(Request $request)
    {
        $id = $request->id;
        $user = Users::find($id); // Use find() instead of where() to get a single record
        if ($user) {
            $staff = Staff::where('users_id', $id)->first();
            if ($staff) {
                $staff->update(['users_id' => null]);
            }
            $user->delete(); // Call delete() on the user instance, not on the query
        }
    }

    public function editAccount($id)
    {
        $data['title'] = "Edit Account";
        $data['users'] = Users::find($id);
        return view('users.account', $data);
    }

    public function updateAccount(Request $request, $id)
    {
        $username         = $request->username;
        $username_old    = $request->username_old;

        $callback            = '';
        if ($username !== $username_old) {
            $callback = "|unique:users";
        }

        $request->validate([
            'username' => 'required|string|max:35|min:5' . $callback,
            'password' => 'nullable'
        ]);

        if (!empty($request->password_new)) {
            $request->request->add(['password' => bcrypt($request->password_new)]);
        }
        $users = Users::where('id', $id)->first();
        $users->update($request->all());

        $message = [
            'alert-type' => 'success',
            'message' => 'Account anda berhasil di-update.'
        ];
        return redirect()->route('profile')->with($message);
    }
}
