@extends('Backend.back')

@section('admincontent')

<div>
    <h2>Tambah Data</h2>
</div>
    
<div class="row">

    <div class="col-6">
        <form action="{{ url('admin/menu') }}" method="post" enctype="multipart/form-data">
            @csrf

            <div class="mt-2">
                <label for="">Kategori</label>
                <select class="form-select" name="idkategori" >
                    @foreach ($kategoris as $kategori)
                        <option value="{{ $kategori->idkategori }}">{{ $kategori->kategori }}</option>
                    @endforeach
                </select>
            </div>
            


            <div class="mt-2">
                <label class="form-label"  for="">Menu</label>
                <input class="form-control" type="text" name="menu" id="">
                <span class="text-danger">
                    @error('menu')
                        {{ $message }}
                    @enderror
                </span>
            </div>

            <div class="mt-2">
                <label class="form-label"  for="">Deskripsi</label>
                <input class="form-control" type="text" name="deskripsi" id="">
                <span class="text-danger">
                    @error('deskripsi')
                        {{ $message }}
                    @enderror
                </span>
            </div>


            <div class="mt-2">
                <label class="form-label"  for="">Harga</label>
                <input class="form-control" type="number" name="harga" id="">
                <span class="text-danger">
                    @error('harga')
                        {{ $message }}
                    @enderror
                </span>
            </div>


            <div class="mt-2">
                <label class="form-label"  for="">Foto Menu</label>
                <input class="form-control" type="file" name="gambar" id="">
                <span class="text-danger">
                    @error('gambar')
                        {{ $message }}
                    @enderror
                </span>
            </div>


            
            
            <div class="mt-4">
                <button type="submit" class="btn btn-primary">Tambahkan</button>
            </div>

        </form>
    </div>
</div>

@endsection